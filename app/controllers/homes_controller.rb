class HomesController < ApplicationController
  def index
    @omikuji = ["大吉", "中吉", "小吉"].sample
  end
end
