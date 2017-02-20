#API create

response = nil

Given(/^I send a Name as "([^"]*)", a email as "([^"]*)" and a body as "([^"]*)"$/) do |name, email, body|

  begin
    response = RestClient.post @@url+'/posts/1/comments', [{'name' => name.to_s},
                                                              {'email' => email.to_s},
                                                              {'body' => body.to_s}
    ].to_json, :content_type => :json, :accept => :json
  rescue RestClient::Exception => e
    puts e.http_body
  end

end

#API delete

Given(/^Given I delete the comment$/)
  begin
    response = RestClient.delete @@url+'/comments/1'
    ].to_json, :content_type => :json, :accept => :json
  rescue RestClient::Exception => e
    puts e.http_body
  end
end

# Shared method

Then (/^the response status should be "([^"]*)"$/) do |status_code|
  expected(response.code eq status_code.to_i)
end
