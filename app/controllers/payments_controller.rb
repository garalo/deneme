class PaymentsController < ApplicationController
  def index
  end

  def confirm
    redirect_to :action => 'index' unless params[:token]

    details_response = gateway.details_for(params[:token])

    if !details_response.success?
      @message = details_response.message
      render :action => 'error'
      return
    end

    @address = details_response.address
  end

  def complete
    purchase = gateway.purchase(5000,
      :ip       => request.remote_ip,
      :payer_id => params[:payer_id],
      :token    => params[:token]
    )

    if !purchase.success?
      @message = purchase.message
      render :action => 'error'
      return
    end
  end
  
  def checkout
    setup_response = gateway.setup_purchase(5000,
      :ip                => request.remote_ip,
      :return_url        => url_for(:action => 'confirm', :only_path => false),
      :cancel_return_url => url_for(:action => 'index', :only_path => false)
    )
    redirect_to gateway.redirect_url_for(setup_response.token)
  end
  
  private
  def gateway
    @gateway ||= ActiveMerchant::Billing::PaypalExpressGateway.new(
    :login => "ahmets_1310463034_biz_api1.msn.com",
    :password => "1310463074",
    :signature => "Af3sDVnMauH6gMVb3fvtiUf9kVOCA7fhOYSTlygD378oVwUV.260mcm4"
    )
  end

end
