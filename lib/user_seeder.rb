module UserSeeder
  def self.user_cron_seeder
    url = 'https://randomuser.me/api/?results=100'
    response = RestClient.get(url)
    # array to store the response
    results = JSON.parse(response.body)
    return fetching_results if User.count <= 2000
  end

  private

  def fetching_results
    results["results"].each do |result|
      puts "Creating user at #{DateTime.now.to_s(:db)}"
      user = User.create!(
        "password" => 6.times.map { rand(10) },
        "name" => {
          "first" => result['name']['first'].capitalize,
          "last" => result['name']['last'].capitalize,
          "title" => result['name']['title'].capitalize
        },
        "gender" => result['gender'],
        "location" => {
          "street" => result['location']['street'],
          "city" => result['location']['city'],
          "state" => result['location']['state'],
          "postcode" => result['location']['postcode'],
          "coordinates" => {
            "latitude" => result['location']['coordinates']['latitude'],
            "longitude" => result['location']['coordinates']['longitude']
          },
          "timezone" => {
            "offset" => result['location']['timezone']['offset'],
            "description" => result['location']['timezone']['description']
          }
        },
        "email" => result['email'],
        "login" => {
          "uuid" => result['login']['uuid'],
          "username" => result['login']['username'],
          "password" => result['login']['password'],
          "salt" => result['login']['salt'],
          "md5" => result['login']['md5'],
          "sha1" => result['login']['sha1'],
          "sha256" => result['login']['sha256']
        },
        "dob" => {
          "date" => result['dob']['date'],
          "age" => result['dob']['age']
        },
        "registered" => {
          "date" => result['registered']['date'],
          "age" => result['registered']['age']
        },
        "phone" => result['phone'],
        "cell" => result['cell'],
        "picture" => {
          "large" => result['picture']['large'],
          "medium" => result['picture']['medium'],
          "thumbnail" => result['picture']['thumbnail']
        },
        "nat" => result['nat'],
        "imported_t" => DateTime.now.to_s(:db),
        "status" => 0
      )
    end
  end
end
