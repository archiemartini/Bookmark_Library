public

def has_expected_content(page)
  array = ['http://www.makersacademy.com/', 'www.destroyallsoftware.com/', 'http://www.google.com/']
  array.all? do |name|
    page.has_content?(name)
  end
end


