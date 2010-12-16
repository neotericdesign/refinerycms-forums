Given /^I have no discussions$/ do
  Discussion.delete_all
end

Given /^I (only )?have discussions titled "?([^"]*)"?$/ do |only, titles|
  Discussion.delete_all if only
  titles.split(', ').each do |title|
    Discussion.create(:title => title)
  end
end

Then /^I should have ([0-9]+) discussions?$/ do |count|
  Discussion.count.should == count.to_i
end
