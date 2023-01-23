class HomesController < ApplicationController
  def top
    flash[:notice] = "Signed out successfully."  # sign_out用フラッシュメッセージ
  end
end
