class SessionIntegrationTest < ActionDispatch::IntegrationTest
  test 'two session test' do # passes
    mel = login(:melissa)
    luis = login(:luis)

    assert_equal 'Welcome melissa!', mel.flash[:notice]
    assert_equal 'Welcome luis!', luis.flash[:notice]
  end

  test 'three session test' do # fails
    mel = login(:melissa)
    luis = login(:luis)
    frank = login(:frank)

    assert_equal 'Welcome melissa!', mel.flash[:notice]
    assert_equal 'Welcome luis!', luis.flash[:notice]
    assert_equal 'Welcome frank!', frank.flash[:notice]
  end

  private

  def login(name, password: 'password')
    open_session do |sess|
      sess.post sessions_url, username: name, password: password
      assert_equal '/sessions', sess.path
    end
  end
end
