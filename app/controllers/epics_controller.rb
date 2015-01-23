class EpicsController < ApplicationController
  before_action :epic, only: [:show, :edit, :update, :destroy]

  require 'epics'

  respond_to :html

  def index
    @epics = ::Epics.new.epic_list

    respond_with(@epics)
  end
end
