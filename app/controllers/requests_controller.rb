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
        history_info: @history_info
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
    # respond_to do |format|
    #   if @history.update(history_params)
    #     format.html { redirect_to @history, notice: 'History was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @history }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @history.errors, status: :unprocessable_entity }
    #   end
    # end
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

  private
  def history_params
    params.require(:request).permit(:id, :user_id, :ad_id, :has_been_seen)
  end

end
