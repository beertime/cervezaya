class ListingSizesText < ActionDispatch::IntegrationTest

  setup { host! 'api.cervezaya.dev' }

  test 'returns list of all sizes (formats)' do
    get '/sizes'
    assert_equal 200, response.status
    refute_empty response.body
  end

end
