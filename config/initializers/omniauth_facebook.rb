# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '767087686961716', '869ba6a5ced2279d8e993094af2d0252',
           scope: 'email',
           display: 'popup',
           local: 'ja_JP',
           info_fields: 'id, name, gender'
end
