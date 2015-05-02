class ListingTypesText < ActionDispatch::IntegrationTest

  setup { host! 'api.cervezaya.dev' }

  test 'returns list of all types' do
    get '/types'
    assert_equal 200, response.status
    refute_empty response.body
  end

end
