# artifacts (plugin jars and other files) 

# An archetype is defined as an original pattern or model from which all other things of the same kind are made. In Maven, 
# an archetype is a template of a project which is combined with some user input to produce a working Maven project 
# that has been tailored to the user's requirements.

# A phase is a step in the build lifecycle, which is an ordered sequence of phases. 

# Creating a Project
mvn    archetype:generate                                                -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
mvn -B archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DgroupId=com.mycompany.app -DartifactId=my-app
# Build the Project (create a JAR)
mvn package

# install it in my local repository
mvn install


