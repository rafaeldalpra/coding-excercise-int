require 'json'

# Filter users within informed radius from the Dublin Office
def around_dublin_office km=100
  # Read the file
  users = load_users
  users = filter_users_by_radius users, km
  
  # Print out
  output = "Users found in #{km}km radius from Dublin Office:\n"
  users.each do |user|
    output += "# #{user["user_id"]} - #{user["name"]}\n"
  end
  output
end

def load_users
  file = File.open("source.txt").read.split("\n")
  file.map!{ |line| JSON.parse(line) }
  file
end

def filter_users_by_radius users, km=100
  users.delete_if{ |line| 
    Geofilter.distance(line["latitude"], line["longitude"]) > km
  }.sort{|k,v|k["user_id"] <=> v["user_id"]}
end

module Geofilter

  # Radians degree rate
  RAD_DEG_RATE = Math::PI / 180
  RAD_KM = 6371
  RAD_METERS = RAD_KM*1000

  # Office's coordinates
  OFFICE_LAT = 53.3393
  OFFICE_LON = -(6.2576841)

  # Returns dinstance in kilometers
  def self.distance lat, lon
    lon = lon.to_f
    lat = lat.to_f
    lon_diff = lon - OFFICE_LON
    lat_diff = lat - OFFICE_LAT

    a = calc_haversine(lat_diff, lat, lon_diff)
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))
    (c*RAD_KM).to_i
  end

  # Haversine Formula
  def self.calc_haversine(lat_diff, lat, lon_diff)
    (Math.sin(rpd(lat_diff)/2))**2 + Math.cos(rpd(OFFICE_LAT)) * Math.cos((rpd(lat))) * (Math.sin(rpd(lon_diff)/2))**2
  end

  # Radians per degree
  def self.rpd(num)
    num * RAD_DEG_RATE
  end
end