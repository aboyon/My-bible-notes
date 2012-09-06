# @author David Silveira

class PrivateController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
end