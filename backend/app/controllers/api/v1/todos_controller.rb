module Api::V1
  class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    # GET /todos
    def index
      @todos = Todo.all
      limit = params[:_limit]

      if limit.present? 
        limit = limit.to_i
        @todos = @todos.last(limit)
      end

      # since we return @todos.last @todos.reverse 
      # is what @todos is.
      render json: @todos.reverse
    end

    # GET /todos/1
    def show
      render json: @todo
    end

    # POST /todos
    def create
      @todo = Todo.new(todo_params)

      if @todo.save
        render json: @todo, status: :created, location: @todo
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /todos/1
    def update
      if @todo.update(todo_params)
        render json: @todo
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end

    # DELETE /todos/1
    def destroy
      @todo.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_todo
        @todo = Todo.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def todo_params
        params.require(:todo).permit(:id, :title, :completed, :_limit)
      end
  end
end
