puts 'Seeding database...'

User.destroy_all
Job.destroy_all
Application.destroy_all

# Create users
user1 = User.create(email: 'user1@example.com', password: 'password')
user2 = User.create(email: 'user2@example.com', password: 'password')
user3 = User.create(email: 'user3@example.com', password: 'password')

# Read jobs from JSON file
file = File.read(Rails.root.join('db/jobs.json'))
jobs_data = JSON.parse(file)

# Create jobs from JSON data
jobs_data.each do |category, jobs|
  jobs.each do |job|
    Job.create!(company: job['organization'], position: job['title'], link: job['url'], image_url: job['organization_logo'])
  end
end

# Create applications
Application.create!(status: 'accepted', date: '2025-02-09', user: user2, job: Job.all[4])
Application.create!(status: 'accepted', date: '2025-01-07', user: user1, job: Job.all[3])
Application.create!(status: 'pending', date: '2025-03-09', user: user3, job: Job.all[2])
Application.create!(status: 'pending', date: '2025-01-20', user: user3, job: Job.all[2])
Application.create!(status: 'accepted', date: '2025-03-03', user: user3, job: Job.all[4])
Application.create!(status: 'accepted', date: '2025-01-16', user: user3, job: Job.all[2])
Application.create!(status: 'pending', date: '2025-01-25', user: user2, job: Job.all[1])
Application.create!(status: 'rejected', date: '2025-03-10', user: user1, job: Job.all[1])
Application.create!(status: 'rejected', date: '2025-02-01', user: user2, job: Job.all[3])
Application.create!(status: 'rejected', date: '2025-03-11', user: user2, job: Job.all[3])

puts 'Seeding complete.'


# client = FantasticJobsClient.new(api_key: "b0150b9224mshdac2c82dec49f39p1521dcjsn48ab6135004f")

# software_engineer_jobs = client
#   .job_title('Software Engineer')
#   .locations('Paris', 'United States', 'Germany', 'United Kingdom')
#   .limit(10)
#   .offset(0)
#   .search

# product_manager_jobs = client
#   .job_title('Product Manager')
#   .locations('Paris', 'United States', 'Germany', 'United Kingdom')
#   .limit(10)
#   .offset(0)
#   .search

# data_engineer_jobs = client
#   .job_title('Data Engineer')
#   .locations('Paris', 'United States', 'Germany', 'United Kingdom')
#   .limit(10)
#   .offset(0)
#   .search

# data_scientist_jobs = client
#   .job_title('Data Scientist')
#   .locations('Paris', 'United States', 'Germany', 'United Kingdom')
#   .limit(10)
#   .offset(0)
#   .search

# marketing_manager_jobs = client
#   .job_title('Marketing Manager')
#   .locations('Paris', 'United States', 'Germany', 'United Kingdom')
#   .limit(10)
#   .offset(0)
#   .search

# operations_manager_jobs = client
#   .job_title('Operations Manager')
#   .locations('Paris', 'United States', 'Germany', 'United Kingdom')
#   .limit(10)
#   .offset(0)
#   .search

# finance_manager_jobs = client
#   .job_title('Finance Manager')
#   .locations('Paris', 'United States', 'Germany', 'United Kingdom')
#   .limit(10)
#   .offset(0)
#   .search


# File.write('jobs.json', JSON.pretty_generate({
#   software_engineer: software_engineer_jobs,
#   product_manager: product_manager_jobs,
#   data_engineer: data_engineer_jobs,
#   data_scientist: data_scientist_jobs,
#   marketing_manager: marketing_manager_jobs,
#   operations_manager: operations_manager_jobs,
#   finance_manager: finance_manager_jobs
# }))
