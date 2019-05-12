class PublicController < ApplicationController

  layout 'public'

  def index

  end

  def uzytkownik
	@uzytkownik = Uzytkownik.new
	@firma_last = Firma.limit(1).order('id desc').pluck(:id).map(&:to_i) 
  end

  def konto
  	firma_last1 = Firma.limit(1).order('firma_id desc').pluck(:firma_id).map(&:to_i) 
  	@firma_last = firma_last1.at(0) + 1
  	@firma = Firma.new
  end

  def utworz
	@firma = Firma.new(firma_parametry)
  @firma.data_wygasniecia = DateTime.now.to_date
  @firma.aktywna = true
  @firma.save!
	 if @firma.save
      redirect_to(:action => "uzytkownik")
    else
      flash[:notice] = "Ooooppss, coś poszło nie tak! Skontaktuj się z Nami, by rozwiązać problem :)"
      render("index")
    end
  end

 def utworz_uzytkownika
	@uzytkownik = Uzytkownik.new(uzytkownik_parametry)
	@uzytkownik.email_confirmed = true
	@uzytkownik.confirm_token = nil
	@uzytkownik.save!
	 if @uzytkownik.save
	  UserMailer.registration_confirmation(@uzytkownik).deliver
      flash[:notice] = "Wysłaliśmy link aktywacyjny na Twojego maila, potwierdź go by kontynuować"
      redirect_to(:action => "index")
    else
      flash[:notice] = "Ooooppss, coś poszło nie tak! Skontaktuj się z Nami, by rozwiązać problem :)"
      render("index")
    end
  end

  def confirm
    uzytkownik = Uzytkownik.find_by_confirm_token(params[:token])
    if uzytkownik
      uzytkownik.email_activate
      redirect_to(:controller => 'dostep', :action=> 'index')
    else
      flash[:notice] = "Użytkownik nie istnieje"
      redirect_to(:action=> 'index')
    end
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

def firma_parametry
    params.require(:firma).permit(:firma_id,:Nazwa,:log_in,:NIP)
end

end
