class Mypage::ApplicationController < ApplicationController
  before_action :require_sign_in!
  before_action :hoge
 
  def hoge
    current_user = User.new
    puts '----------------------'
    p current_user.role = 0
    p [current_user.read_only?, true]
    p [current_user.page?, false]
    p [current_user.designer?, false]
    p [current_user.subscriber?, false]
    puts '----------------------'
    p current_user.role = 1
    p [current_user.read_only?, true]
    p [current_user.page?, true]
    p [current_user.designer?, false]
    p [current_user.subscriber?, false]
    puts '----------------------'
    p current_user.role = 2
    p [current_user.read_only?, true]
    p [current_user.page?, false]
    p [current_user.designer?, true]
    p [current_user.subscriber?, false]
    puts '----------------------'
    p current_user.role = 3
    p [current_user.read_only?, true]
    p [current_user.page?, true]
    p [current_user.designer?, true]
    p [current_user.subscriber?, false]
    puts '----------------------'
    p current_user.role = 4
    p [current_user.read_only?, true]
    p [current_user.page?, false]
    p [current_user.designer?, false]
    p [current_user.subscriber?, true]
    puts '----------------------'
    p current_user.role = 5
    p [current_user.read_only?, true]
    p [current_user.page?, true]
    p [current_user.designer?, false]
    p [current_user.subscriber?, true]
    puts '----------------------'
    p current_user.role = 6
    p [current_user.read_only?, true]
    p [current_user.page?, false]
    p [current_user.designer?, true]
    p [current_user.subscriber?, true]
    puts '----------------------'
    p current_user.role = 7
    p [current_user.read_only?, true]
    p [current_user.page?, true]
    p [current_user.designer?, true]
    p [current_user.subscriber?, true]
  end
end
