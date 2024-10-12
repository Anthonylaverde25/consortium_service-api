

require 'rails_helper'

RSpec.describe ConsortiumsController, type: :controller do
  let!(:consortium) { Consortium.create!(
    name: "Consorcio 1",
    description: "Descripción 1",
    email: "consorcio1@ejemplo.com",
    phone_number: "1234567891",
    legal_representative: "Rep 1",
    status: :active,
    registration_number: "REG1",
    country: "Country1",
    state_province: "State1",
    city: "City1",
    address: "Address1",
    postal_code: "11111",
    website: "http://example.com",
    organization_type: "Type1"
  ) }
  # Atributos validos
  let(:valid_attributes) {
    {
      name: "Consorcio de Prueba",
      description: "Descripción del consorcio",
      email: "info@consorcio.com",
      phone_number: "123456789",
      legal_representative: "Representante Legal",
      status: "pending"
    }
  }

  # Atributos invalidos
  let(:invalid_attributes) {
    {
      name: "",
      email: "invalid_email",
      phone_number: "123456789",
      legal_representative: "Representante Legal",
      status: "pending"
    }
  }

  describe 'GET #index' do
    it 'returns a successful response with all consortiums' do
      get :index
      expect(response).to be_successful

      expect(JSON.parse(response.body)).to match_array(Consortium.where(deleted_at: nil).as_json(only: [
        :id, :name, :description, :email, :phone_number,
        :registration_number, :legal_representative, :country,
        :state_province, :city, :address, :postal_code,
        :website, :organization_type, :status,
        :created_at, :updated_at, :deleted_at
      ]))
    end

    it 'handles errors correctly' do
      allow_any_instance_of(ConsortiumUsecase::FindAllConsortium).to receive(:call).and_raise(StandardError.new("Some error"))

      expect(Rails.logger).to receive(:error).with(/Error retrieving all consortiums: Some error/)
      get :index
      expect(response).to have_http_status(:internal_server_error)
      expect(JSON.parse(response.body)).to eq({ "error" => "Internal Server Error" })
    end
  end

  describe "GET #show" do
    it 'returns a successful response with the requested consortium' do
      get :show, params: { id: consortium.id }
      expect(response).to be_successful

      expect(JSON.parse(response.body)).to eq(consortium.as_json(only: [
        :id, :name, :description, :email, :phone_number,
        :registration_number, :legal_representative, :country,
        :state_province, :city, :address, :postal_code,
        :website, :organization_type, :status,
        :created_at, :updated_at, :deleted_at
      ]))
    end

    it 'returns a 404 if the consortium is not found' do
      get :show, params: { id: -1 } # ID que no existe
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to eq({ "error" => "Consortium not found" })
    end
  end

  describe "POST #create" do
    context "with valid paremeters" do
      it 'creates a new Consortium' do
        expect {
          post :create, params: { consortium: valid_attributes }
      }.to change(Consortium, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["name"]).to eq("Consorcio de Prueba")
      end
    end

    context "with invalid parameters" do
      it 'does not create a new Consortium' do
        expect {
          post :create, params: { consortium: invalid_attributes }
      }.to change(Consortium, :count).by(0)
      expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end









  # describe "PUT #update" do
  #   context "with valid parameters" do
  #     let(:valid_params) do
  #       {
  #         consortium: {
  #           name: "Updated Consortium",
  #           description: "Updated description for the consortium.",
  #           email: "updated@example.com",
  #           phone_number: "555-987-6543",
  #           legal_representative: "Updated Representative",
  #           status: :active,
  #           registration_number: "REG-UPDATED",
  #           country: "Updated Country",
  #           state_province: "Updated State",
  #           city: "Updated City",
  #           address: "Updated Address",
  #           postal_code: "22222",
  #           website: "http://updatedconsortium.com",
  #           organization_type: "Updated Type"
  #         }
  #       }
  #     end

  #     it "updates the existing consortium" do
  #       put :update, params: { id: consortium.id, consortium: valid_params[:consortium] }
  #       consortium.reload # Recarga el consorcio para obtener los valores actualizados

  #       expect(response).to have_http_status(:ok)
  #       expect(consortium.name).to eq("Updated Consortium")
  #       expect(consortium.description).to eq("Updated description for the consortium.")
  #       expect(JSON.parse(response.body)).to include("name" => "Updated Consortium")
  #     end
  #   end

  #   context "with invalid parameters" do
  #     let(:invalid_params) do
  #       {
  #         consortium: {
  #           name: "", # Nombre vacío debería causar un error
  #           email: "invalid-email" # Email inválido también debería causar un error
  #         }
  #       }
  #     end

  #     it "does not update the consortium and returns errors" do
  #       put :update, params: { id: consortium.id, consortium: invalid_params[:consortium] }

  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(JSON.parse(response.body)).to include("errors")
  #       consortium.reload # Verifica que no se haya actualizado
  #       expect(consortium.name).not_to eq("")
  #     end
  #   end

  #   context "when consortium is not found" do
  #     it "returns a 404 status" do
  #       put :update, params: { id: -1, consortium: { name: "Should not exist" } }
  #       expect(response).to have_http_status(:not_found)
  #       expect(JSON.parse(response.body)).to eq({ "error" => "Consortium not found" })
  #     end
  #   end
  # end
end
