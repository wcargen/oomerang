class ItemsController < ApplicationController
  
  def index
    items = Item.all
    itemsInfo = []
    items.each do |i|
      itemsInfo.push({id:i.id,status:i.status,lat:i.location.latitude,lng:i.location.longtitude})
    end
    respond_to do |format|
      format.json {render :json => itemsInfo}
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
