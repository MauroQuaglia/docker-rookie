class CarsController < ApplicationController

  def index
    @f1s = F1.all
  end

end
