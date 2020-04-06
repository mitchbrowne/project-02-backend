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

  def galleries
    @galleries = Gallery.all
    if @galleries
      render json: {
        galleries: @galleries
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

  def companies
    @companies = Company.all
    if @companies
      render json: {
        companies: @companies
      }
    else
      render json: {
        status: 500,
        errors: ['no companies']
      }
    end
  end
end
