class BoardsController < ApplicationController
  before_action :set_target_board, only: [:show, :destroy, :edit, :update]
  def index
    @boards = Board.page(params[:page]).order(created_at: :desc)
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board, flash: { notice: "#{@board.title}を投稿しました。" }
    else
      redirect_to new_board_path, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy
    @board.delete
    redirect_to boards_path, flash: { notice: "#{@board.title}を削除しました。" }
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to @board
  end

  def show
    @comment = Comment.new(board_id: @board.id)
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end
