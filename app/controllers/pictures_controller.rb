class PicturesController < ApplicationController
  def new_form
      
      render("pic_templates/new_form.html.erb")
  end
  def create_row
      @new = Photo.new
      @new.source = params["source_input"]
      @new.caption = params["caption_input"]
      @new.save
      @pic = Photo.all
      
      render("pic_templates/create_row.html.erb")
  end 
  def index
     @pictures = Photo.all
     
      render("pic_templates/index.html.erb")
  end
  def show
     
    @pic = Photo.find(params["an_id"])
    
      render("pic_templates/show.html.erb")
  end
  def edit_form
      @photo_id = params["some_id"].to_i
      @pic = Photo.find(@photo_id)
      
      render("pic_templates/edit_form.html.erb")
  end
  def update_row
      @id = params["the_id"].to_i
      p = Photo.find(@id)
      p.source =params["source_input"]
      p.caption = params["caption_input"]
      p.save
     render("pic_templates/update_row.html.erb") 
  end
  def destroy_row
      @id = params["toast_id"].to_i
      p = Photo.find(@id)
      p.destroy
      @count = Photo.count  
      render("pic_templates/destroy_row.html.erb")
  end
end