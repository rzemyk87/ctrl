class PublicController < ApplicationController

  layout 'public'

  def index

  end

  def przypomnienie
  	@uzytkownik = Uzytkownik.find_by_email(params[:email])
  	if @uzytkownik.present?
  			@uzytkownik.generate_password_token!
  			UserMailer.forgot_password(@uzytkownik).deliver
  		flash[:notice] = "Wysłaliśmy email z restartem hasła!"
  	else

  	end
  end

  def nowe_haslo
  	@uzytkownik = $uzytkownik
  	
    if @uzytkownik.update_attributes(uzytkownik_parametry)

      	flash[:notice] = "Hasło zostało pomyślnie zresetowane"
      	redirect_to(:action => "index")
      	@uzytkownik.reset_password
    else
      render("index")
    end 
  end

  def reset
    $uzytkownik = Uzytkownik.find_by_reset_password_token(params[:token])

    if $uzytkownik
      render("reset")
    else
      flash[:notice] = "Użytkownik nie istnieje"
      redirect_to( :controller => 'dostep', :action=> 'index')
    end
  end

  private

  def uzytkownik_parametry
       params.require(:uzytkownik).permit(:imie, :nazwisko, :email, :uzytkownik, :password, :password_confirmation, :firma_id, :email_confirmed, :confirm_token, :uprawnienia, :reset_password_token)
  end

end
