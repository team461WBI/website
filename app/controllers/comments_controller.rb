class CommentsController < InheritedResources::Base
	load_and_authorize_resource

	def index
		if current_user.admin? 
			@comments = Comment.all
		else
			@comments = current_user.comments
		end
	end
	
	def create
		@comment = Comment.new(params[:comment])
		
		if @comment.save && @comment.errors.count == 0
			flash[:notice] = ["Created comment", @comment.id, "successfully"].join(" ")
			
			if @comment.parent_id
				redirect_to @comment.parent
			else
				redirect_to @comment
			end
		else
			flash[:error] = @comment.errors.to_a.join(", ")
			
			if @comment.parent_id
				redirect_to @comment.parent
			else
				redirect_to :new
			end
		end
	end

	def destroy
		forum = @comment.forum
		
		@comment.destroy
		
		respond_to do |format|
			format.html { redirect_to forum }
			format.json { head :no_content }
		end
	end
end
