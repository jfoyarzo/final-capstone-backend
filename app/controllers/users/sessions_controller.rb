class Users::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_signed_out_user, only: :destroy

  # DELETE /resource/sign_out
  def destroy
    if current_user
      sign_out(@user)
      render json: {
        status: {
          code: 200,
          message: 'Signed out successfully.'
        }
      }, status: :ok
    else
      render json: {
        status: {
          code: 401,
          message: 'Could not find a signed in user.'
        }
      }, status: :unauthorized
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Signed in successfully.' },
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end
end
