# encoding: UTF-8    
require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ReservasController do

  # This should return the minimal set of attributes required to create a valid
  # Reserva. As you add validations to Reserva, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:nome => 'João Paulo da Silva',
     :email => 'joao@exemplo.com',
     :quantidade_de_pessoas => 5,
     :dia_desejado => Date.today,
     :horario_desejado => '11:30'}
  end
  
  def atributos_de_dia_e_horario
    {:dia_desejado => Date.today,
    :horario_desejado => '11:30'} 
  end
  
  login_user

  describe "GET index" do
    context "Caso usuário esteja autenticado" do
      context "caso usuário seja do staff" do  
        it "assigns all reservas as @reservas" do
          reserva = Reserva.create! valid_attributes
          get :index
          assigns(:reservas).should_not be_kind_of(Array)
        end
        it "deve conter reservas separadas por dias e horarios em @reservas_por_saidas" do
          # reservas_por_saida = {[Date.today, "11:30"] => }}
          get :index
          assigns(:reservas_por_saida).should be_kind_of(Hash)
        end
      end
      context "caso usuário não seja do staff" do
        it "deve ser redirecionado para uma mensagem de não autorizado" do
          
        end
      end    
    end
    context "dado um usuário não autenticado" do
      it "deve redirecionar para criar um novo usuário" do
        pending
      end
    end
    context "caso os parametros dia_desejado for hj e horario_desejado for 11:30" do
      it "deve listar todas as reservas desse dia uma a uma" do 
        reserva = Reserva.create valid_attributes
        reserva_postergada = Reserva.new(valid_attributes).dia_desejado = Date.today + 1
        get :index, :dia_desejado => Date.today.to_s, :horario_desejado => "11:30"
        assigns(:reservas).should include(reserva)
        assigns(:reservas).should_not include(reserva_postergada)
      end 
    end
  end

  describe "GET show" do
    it "assigns the requested reserva as @reserva" do
      reserva = Reserva.create! valid_attributes
      get :show, :id => reserva.id
      assigns(:reserva).should eq(reserva)
    end
  end

  describe "GET new" do
    it "assigns a new reserva as @reserva" do
      get :new
      assigns(:reserva).should be_a_new(Reserva)
    end
    context "caso os parametros dia_desejado e horario_desejado estiverem presentes" do
      it "deve atribuir os valores aos dias e horarios desejados" do
        get :new, :dia_desejado => Date.today.to_s, :horario_desejado => "11:30"
        assigns(:reserva).dia_desejado.should eq((Reserva.new atributos_de_dia_e_horario).dia_desejado)
        assigns(:reserva).horario_desejado.should eq((Reserva.new atributos_de_dia_e_horario).horario_desejado)
      end
    end
  end

  describe "GET edit" do
    it "assigns the requested reserva as @reserva" do
      reserva = Reserva.create! valid_attributes
      get :edit, :id => reserva.id
      assigns(:reserva).should eq(reserva)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reserva" do
        expect {
          post :create, :reserva => valid_attributes
        }.to change(Reserva, :count).by(1)
      end

      it "assigns a newly created reserva as @reserva" do
        post :create, :reserva => valid_attributes
        assigns(:reserva).should be_a(Reserva)
        assigns(:reserva).should be_persisted
      end

      it "redirects to the created reserva" do
        post :create, :reserva => valid_attributes
        response.should redirect_to(Reserva.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reserva as @reserva" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reserva.any_instance.stub(:save).and_return(false)
        post :create, :reserva => {}
        assigns(:reserva).should be_a_new(Reserva)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reserva.any_instance.stub(:save).and_return(false)
        post :create, :reserva => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reserva" do
        reserva = Reserva.create! valid_attributes
        # Assuming there are no other reservas in the database, this
        # specifies that the Reserva created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reserva.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => reserva.id, :reserva => {'these' => 'params'}
      end

      it "assigns the requested reserva as @reserva" do
        reserva = Reserva.create! valid_attributes
        put :update, :id => reserva.id, :reserva => valid_attributes
        assigns(:reserva).should eq(reserva)
      end

      it "redirects to the reserva" do
        reserva = Reserva.create! valid_attributes
        put :update, :id => reserva.id, :reserva => valid_attributes
        response.should redirect_to(reserva)
      end
    end

    describe "with invalid params" do
      it "assigns the reserva as @reserva" do
        reserva = Reserva.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reserva.any_instance.stub(:save).and_return(false)
        put :update, :id => reserva.id, :reserva => {}
        assigns(:reserva).should eq(reserva)
      end

      it "re-renders the 'edit' template" do
        reserva = Reserva.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reserva.any_instance.stub(:save).and_return(false)
        put :update, :id => reserva.id, :reserva => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reserva" do
      reserva = Reserva.create! valid_attributes
      expect {
        delete :destroy, :id => reserva.id
      }.to change(Reserva, :count).by(-1)
    end

    it "redirects to the reservas list" do
      reserva = Reserva.create! valid_attributes
      delete :destroy, :id => reserva.id
      response.should redirect_to(reservas_url)
    end
  end

end
