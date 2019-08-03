# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
