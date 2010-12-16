Given /^I have no discussion_replies$/ do
  DiscussionReply.delete_all
end


Then /^I should have ([0-9]+) discussion_replies?$/ do |count|
  DiscussionReply.count.should == count.to_i
end
