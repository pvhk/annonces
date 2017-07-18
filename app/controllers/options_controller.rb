class OptionsController < ApplicationController
  def index
    @options = Option.all
  end
end
