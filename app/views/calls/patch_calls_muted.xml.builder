xml.instruct!
xml.Response do
    xml.Say "Your line is muted."
    xml.Dial do
    	xml.Conference("conference", "muted"=>"true")
    end
end