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

  def payment_new
    render({ :template => "omnicalc_templates/payment_new" })
  end

  def payment_results
      # 1. grab & convert inputs
  apr_percent = params.fetch("apr").to_f
  monthly_rate = apr_percent / 100 / 12

  years = params.fetch("years").to_i
  total_months = years * 12

  principal = params.fetch("principal").to_f

  # 2. format things for display
  @apr_show       = apr_percent.to_fs(:percentage, {:precision => 4})
  @years          = years
  @principal_show = principal.to_fs(:currency)

  # 3. calculate the payment
  numerator   = monthly_rate * principal
  denominator = 1 - (1 + monthly_rate) ** -total_months
  payment     = numerator / denominator

  @payment_show = payment.to_fs(:currency)
    
    render({ :template => "omnicalc_templates/payment_results" })
  end
end
