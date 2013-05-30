User.delete_all
Album.delete_all
Photo.delete_all

fred = User.create!(email: 'fred@example.com', name: 'Fred Tester', password: 'password', password_confirmation: 'password')

{
  'Family'  => ['Mum', 'Dad', 'Sprog'],
  'Friends' => ['Bill', 'John', 'Steve', 'Mary', 'Martha'],
  'Pets'    => ['Frog', 'Cat']
}.each do |album_name, photos|
  album = fred.albums.create(name: album_name)
  photos.each do |photo_title|
    album.photos.create(title: photo_title)
  end
end