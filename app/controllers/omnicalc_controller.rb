class OmnicalcController < ApplicationController
  def home
    render({ :template => "omnicalc_templates/home" })
  end
  
  def square_new
    render({ :template => "omnicalc_templates/square_new" })
  end

  def square_results
    @the_num = params.fetch("users_number").to_f
    @the_square = @the_num ** 2
    render({ :template => "omnicalc_templates/square_results" })
  end

  def square_root_new
    render({ :template => "omnicalc_templates/square_root_new" })
  end

  def square_root_results
    @the_num = params.fetch("users_number").to_f
    @the_square = Math.sqrt(@the_num)
    render({ :template => "omnicalc_templates/square_root_results" })
  end
end
