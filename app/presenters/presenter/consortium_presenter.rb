# app/presenters/presenter/consortium_presenter.rb
module Presenter
  module ConsortiumPresenter
    def self.as_json(consortium)
      {
        id: consortium.id,
        name: consortium.name,
        description: consortium.description,
        # created_at: consortium.created_at.iso8601, # Formato ISO 8601
        # updated_at: consortium.updated_at.iso8601,
        email: consortium.email,
        phone_number: consortium.phone_number,
        registration_number: consortium.registration_number,
        legal_representative: consortium.legal_representative,
        country: consortium.country,
        state_province: consortium.state_province,
        city: consortium.city,
        address: consortium.address,
        postal_code: consortium.postal_code,
        website: consortium.website,
        organization_type: consortium.organization_type,
        status: consortium.status,
        deleted_at: consortium.deleted_at&.iso8601 # Solo incluye si existe
      }
    end
  end
end
