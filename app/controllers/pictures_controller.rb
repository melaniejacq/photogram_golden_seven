class PicturesController < ApplicationController
    
# CREATE
    def new_form
        render("pic_templates/new_form.html.erb")
    end
    
    def create_row
    # create a new row for the photos table
    # fill in its column values by pulling the information the user typed into the form out of the params hash
    # save it
    
    p = Photo.new
   
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    
    p.save
    
    @current_count = Photo.count

        render("pic_templates/create_row.html.erb")
        
    #see if grading check has preference between this or ...
    #redirect_to("/photos")
        
    end
    

# READ
    def index
        @list_of_photos = Photo.order(:created_at => :desc)
        
        render("pic_templates/index.html.erb")
    end
    
    def show
        @image = Photo.find(params[:the_id])        
        @time_ago = (Time.now - @image.updated_at).to_i/(24*60*60)
        
        render("pic_templates/show.html.erb")
    end

# UPDATE
    def edit_form
        @photo = Photo.find(params[:the_id])
        
        render("pic_templates/edit_form.html.erb")
    end
    
    def update_row
        p = Photo.find(params[:the_id])
        
        p.source = params[:the_source]
        p.caption = params[:the_caption]
        
        p.save
        
        @the_id = p.id
        
        render("pic_templates/update_row.html.erb")
        
        # check if grading prefers:
        # redirect_to("/photos")
        
    end

# DELETE

    def destroy_row
        p = Photo.find(params[:the_id])
        
        p.destroy
        
        @remaining_count = Photo.count
        
        render("pic_templates/destroy_row.html.erb")
        
        # check if grading prefers:
        # redirect_to("/photos")
    end

end