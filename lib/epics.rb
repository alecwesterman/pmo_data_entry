class Epics

  def project_list
    project_url = "https://jira.movenetworks.com/rest/api/2/issue/createmeta"
    response = RestClient::Request.new(
        :method => :get,
        :url => project_url,
        :user => 'awesterman@qwinixtech.com',
        :password => '1Limburger',
        :headers => { :accept => :json,:content_type => :json},
    ).execute
    project_list = JSON.parse(response.to_str)
    project_array = []
    project_list["projects"].each do |project|
      project_hash = {name: '', issuetypes: []}
      project_hash[:name] = project["name"]
      project["issuetypes"].each do |issuetype|
        project_hash[:issuetypes] << issuetype["name"]
      end
      project_array << project_hash
    end
    project_array
  end

  def epic_list
    epic_url = "https://jira.movenetworks.com/rest/api/2/search?jql=issuetype=Epic"
    response = RestClient::Request.new(
    :method => :get,
    :url => epic_url,
    :user => 'awesterman@qwinixtech.com',
    :password => '1Limburger',
    :headers => { :accept => :json,:content_type => :json},
    ).execute
    epic_list = JSON.parse(response.to_str)
    epic_array = []
    epic_list["issues"].each do |project|
      epic_array << project["key"]
    end
    epic_hash_array = []
    epic_array.each do |key|
      epic_hash = {key: key, issue_statuses: nil}
      epic_issues_url = "https://jira.movenetworks.com/rest/api/2/search?jql=%22epic%20link%22=#{key}"
      response = RestClient::Request.new(
      :method => :get,
      :url => epic_issues_url,
      :user => 'awesterman@qwinixtech.com',
      :password => '1Limburger',
      :headers => { :accept => :json,:content_type => :json},
      ).execute
      epic_issues = JSON.parse(response.to_str)
      issue_status_count_hash = {"Open"=> 0, "Reopened"=> 0, "Closed"=> 0, "Client Review"=> 0, "Dev Done"=> 0, "Resolved"=> 0, "QA Ready"=> 0, "In Progress" => 0}
      epic_issues["issues"].each do |issue|
        status = issue["fields"]["status"]["name"]
        issue_status_count_hash[status] += 1
      end
      epic_hash[:issue_statuses] = issue_status_count_hash
      epic_hash_array << epic_hash
    end
    epic_hash_array
  end
end
