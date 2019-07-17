# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DriverDetail.create(license_no: 'AB12', expiry_date: '22-10-2016', shift: '10-8', status: 'Available', minimum_charge: 2, user_id: 4)

#  CabDetail.create(number_plate:"MP26DK8332",cab_id:1,driver_detail_id:1)
#  CabDetail.create(number_plate:"MP26DK8334",cab_id:2,driver_detail_id:1)
#  CabDetail.create(number_plate:"MP26DK8335",cab_id:3,driver_detail_id:1)
#  CabDetail.create(number_plate:"MP26DK8336",cab_id:4,driver_detail_id:1)

	# Cab.create(cab_type:"Auto",minimum_charge:40,class_type:"economic",rate_per_km:4,rate_per_hour:10)
 #  Cab.create(cab_type:"Micro",minimum_charge:40,class_type:"economic",rate_per_km:8,rate_per_hour:20)
 #  Cab.create(cab_type:"Mini",minimum_charge:40,class_type:"economic",rate_per_km:12,rate_per_hour:30)
 #  Cab.create(cab_type:"Prime Seldon",minimum_charge:40,class_type:"prime",rate_per_km:16,rate_per_hour:40)

	# DriverDetail.create(license_no: 'AB12', expiry_date: '22-10-2016', shift: '10-8', status: 'Available', tenure_expiry_date:'15-2-2030', user_id: 3)


	# DriverDetail.create(license_no: 'AB13', expiry_date: '22-10-2016', shift: '10-8', status: 'Available', tenure_expiry_date:'15-2-2030', user_id: 4)

	# DriverDetail.create(license_no: 'AB14', expiry_date: '22-10-2016', shift: '10-8', status: 'Available', tenure_expiry_date:'15-2-2030', user_id: 5)

	# City.create(name:"indore")
	# City.create(name:"ujjain")
	# City.create(name:"bhopal")
	# City.create(name:"pratapgarh")

	# Circle.create(name:"rajwada", city_id:1)
	# Circle.create(name:"palasia", city_id:1)
	# Circle.create(name:"khajrana", city_id:2)
	# Circle.create(name:"rajwada", city_id:1)
	# Circle.create(name:"khajrana", city_id:2)
	# Circle.create(name:"rajwada", city_id:3)
	# Circle.create(name:"khajrana", city_id:3)
	# Circle.create(name:"rajwada", city_id:4)

	# Circle.create(name:"palasia", city_id:4)

	# DriverDetail.create(license_no: 'AB15', expiry_date: '22-10-2016', shift: '10-8', status: 'Available', tenure_expiry_date:'15-2-2030', user_id: 6)

Coupon.create(description:"Off50",status:"Available")

Coupon.create(description:"Off100",status:"NA")
Coupon.create(description:"Off60",status:"NA")



 # CabDetail.create(number_plate:"MP26DK8332", circle_id:1,cab_id:1,user_id:3)
 # CabDetail.create(number_plate:"MP26DK8332", circle_id:2,cab_id:1,user_id:4)
 # CabDetail.create(number_plate:"MP26DK8332", circle_id:1,cab_id:1,user_id:5)
