class ItemsController < ApplicationController
  
  def index
    items = Item.all
    itemsInfo = []
    items.each do |i|
      itemsInfo.push(
        {id:i.id,
        status:i.status,
        lat:i.location.latitude,
        lng:i.location.longtitude
        #title:i.title????
        # cat1:Category.find_by_id(i.category.parent_id).name,
        # cat2:i.category.name,
        # date:i.location.date.strftime("%m/%d/%Y"),
        # time:i.location.time.strftime("%I:%M%p"),
        # place:i.location.details,
        # extra_info:i.details
        })
    end
    respond_to do |format|
      format.json {render :json => itemsInfo}
    end
  end

  def found
    loc = Location.create(latitude:params[:latitude],longtitude:params[:longitude])
    item = Item.new
    item.status = params[:status]
    item.location = loc
    item.save

    respond_to do |format|
      format.json {render :json => ['success']}
    end
  end

  def lost
    loc = Location.create(latitude:params[:latitude],longtitude:params[:longitude])
    item = Item.new
    item.status = params[:status]
    item.location = loc
    item.save

    respond_to do |format|
      format.json {render :json => ['success']}
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
