Given /^I have no discussion_topics$/ do
  DiscussionTopic.delete_all
end

Given /^I (only )?have discussion_topics titled "?([^"]*)"?$/ do |only, titles|
  DiscussionTopic.delete_all if only
  titles.split(', ').each do |title|
    DiscussionTopic.create(:name => title)
  end
end

Then /^I should have ([0-9]+) discussion_topics?$/ do |count|
  DiscussionTopic.count.should == count.to_i
end
