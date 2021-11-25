class AdminsController < ApplicationController
  NUMBER = 5
  before_action :authenticate_user!
end