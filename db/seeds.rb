# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Investor
# "investment_stages"=>["pre_seeding_investing", "seed_funding", "seriesA", "seriesB", "seriesC", "late_stage"]
# "last_investment_stages"=>["pre_seeding_investing", "seed_funding", "seriesA", "seriesB", "seriesC", "late_stage"]
# "investment_category"=>["banking", "telecom", "pharma", "oil_and_gas", "interactive_media", "automotive", "consumer_electronics", "e_commerce", "others"]
# "investment_industry"=>["banking", "telecom", "pharma", "oil_and_gas", "interactive_media", "automotive", "consumer_electronics", "e_commerce", "others"]
# "emerging_technologies"=>["ai", "fintech", "iot", "5G", "bio_tech", "cloud_computing", "cyber_security", "enterprise_technology", "green_technology", "consumer_technology", "others"]
# "previous_emerging_technologies"=>["ai", "fintech", "iot", "5G", "bio_tech", "cloud_computing", "cyber_security", "enterprise_technology", "green_technology", "consumer_technology", "others"]

if Rails.env.development?
  Investor.create(first_name: "startup", last_name: "1", email: "startup1@gmail.com", company_name: "startup1",
    country: "afghanistan", part_of_accelerator: "yes", investment_rates: "1M", previous_investment_rates: "1M",
    investment_stages: ["pre_seeding_investing"], last_investment_stages: ["pre_seeding_investing"],
    investment_category: ["banking"], investment_industry: ["banking"], emerging_technologies: ["ai"],
    previous_emerging_technologies: ["ai"])
  Investor.create(first_name: "startup", last_name: "1", email: "startup1@gmail.com", company_name: "startup1",
    country: "afghanistan", part_of_accelerator: "yes", investment_rates: "1M", previous_investment_rates: "1M",
    investment_stages: ["seed_funding"], last_investment_stages: ["seed_funding"],
    investment_category: ["telecom"], investment_industry: ["telecom"], emerging_technologies: ["fintech"],
    previous_emerging_technologies: ["fintech"])
  Investor.create(first_name: "startup", last_name: "1", email: "startup1@gmail.com", company_name: "startup1",
    country: "afghanistan", part_of_accelerator: "yes", investment_rates: "1M", previous_investment_rates: "1M",
    investment_stages: ["seriesA"], last_investment_stages: ["seriesA"],
    investment_category: ["pharma"], investment_industry: ["pharma"], emerging_technologies: ["iot"],
    previous_emerging_technologies: ["iot"])
  Investor.create(first_name: "startup", last_name: "1", email: "startup1@gmail.com", company_name: "startup1",
    country: "afghanistan", part_of_accelerator: "yes", investment_rates: "1M", previous_investment_rates: "1M",
    investment_stages: ["seriesB"], last_investment_stages: ["seriesB"],
    investment_category: ["oil_and_gas"], investment_industry: ["oil_and_gas"], emerging_technologies: ["5G"],
    previous_emerging_technologies: ["5G"])
  Investor.create(first_name: "startup", last_name: "1", email: "startup1@gmail.com", company_name: "startup1",
    country: "afghanistan", part_of_accelerator: "yes", investment_rates: "1M", previous_investment_rates: "1M",
    investment_stages: ["seriesC"], last_investment_stages: ["seriesC"],
    investment_category: ["interactive_media"], investment_industry: ["interactive_media"], emerging_technologies: ["bio_tech"],
    previous_emerging_technologies: ["bio_tech"])
end