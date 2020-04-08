class RequestsController < ApplicationController


  def ads
    @ads = Ad.all
    if @ads
      render json: {
        ads: @ads
      }
    else
      render json: {
        status: 500,
        errors: ['no ads found']
      }
    end
  end

  def user_ads
    @user = User.find(params[:id])
    @ads = @user.company.ads
  end

  def companies_show
    @company = Company.find(params[:id])
    if @company
      render json: {
        company: @company
      }
    else
      render json: {
        status: 500,
        errors: ['no company found']
      }
    end
  end

  def galleries
    @galleries = Gallery.all
    @companies = @galleries.map do |gallery|
      company = gallery.user.company if gallery.user && gallery.user.company && !gallery.user.company.name.nil?
    end
    if @galleries
      render json: {
        galleries: @galleries,
        companies: @companies
      }
    else
      render json: {
        status: 500,
        errors: ['no galleries found']
      }
    end
  end

  def galleries_show
    @gallery = Gallery.find(params[:id])
    @ads = @gallery.ads

    # create a history for each ad, update to current_user
    @histories = @ads.map do |ad|
      h = History.new
      h.user_id = 2
      h.ad_id = ad.id
      h.save
      h
    end

    if @gallery
      render json: {
        gallery: @gallery,
        ads: @ads,
        histories: @histories
      }
    else
      render json: {
        status: 500,
        errors: ['no gallery found']
      }
    end
  end

  # send all histories for each ad in specific gallery
  def histories_show
    @gallery = Gallery.find(params[:id])
    @ads = @gallery.ads
    @history_info = @ads.map do |ad|
      has_seen_total = ad.histories.count { |e| e.has_been_seen == true }
      has_notseen_total = ad.histories.count { |e| e.has_been_seen == false }
      total = has_seen_total + has_notseen_total
      history = {
        has_seen_total: has_seen_total,
        has_notseen_total: has_notseen_total,
        total: total
      }

    end

    if @history_info
      render json: {
        gallery: @gallery,
        ads: @ads,
        history_info: @history_info,
      }
    else
      render json: {
        status: 500,
        errors: ['no histories found']
      }
    end
  end

  def histories_update
    @history = History.find history_params[:id]
    @history.update history_params
    @history.save
  end

  private
  def history_params
    params.require(:request).permit(:id, :user_id, :ad_id, :has_been_seen)
  end

end
