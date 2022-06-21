## Search-Algorithms-in-AI <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./Matlab_Logo.png" width="25">

Searching is the universal technique of problem solving in AI. this project will give you a start with these different algorithms : 
- **Brute-Force Search Strategies**
    * Breadth-First Search : 
    It starts from the root node, explores the neighboring nodes first and moves towards the next level neighbors. It generates one          tree at a time until the solution is found. It can be implemented using FIFO queue data structure. This method provides shortest path to the solution.**Disadvantage :** Since each level of nodes is saved for creating next one, it consumes a lot of memory space. Space requirement to store nodes is exponential. 
    * Depth-First Search :
    It is implemented in recursion with LIFO stack data structure. It creates the same set of nodes as Breadth-First method, only in the different order.**Disadvantage :** this algorithm may not terminate and go on infinitely on one path. The solution to this issue is to choose a cut-off depth. If the ideal cut-off is d, and if chosen cut-off is lesser than d, then this algorithm may fail. If chosen cut-off is more than d, then execution time increases. 
- **Informed (Heuristic) Search Strategies**
    * **A Star Search** :
    It is best-known form of Best First search. It avoids expanding paths that are already expensive, but expands most promising paths first.f(n) = g(n) + h(n), where :         
      - g(n) the cost (so far) to reach the node
      - h(n) estimated cost to get from the node to the goal
      - f(n) estimated total cost of path through n to goal.
 In this project we've implemented A* algorithm with : 
      - **The Manhattan Distance Heuristic** : this method of computing is called the Manhattan method because it is computed by calculating the total number of squares moved horizontally and vertically to reach the target square from the current square. We ignore diagonal movement and any obstacles that might be in the way.
      - **The Euclidean Distance Heuristic** : his heuristic is slightly more accurate than its **Manhattan** counterpart. If we try run both simultaneously on the same maze, the Euclidean path finder favors a path along a straight line. This is more accurate but it is also slower because it has to explore a larger area to find the path.
      
## References : 
  - Patel, A. Introduction to A*. Retrieved April 29, 2016
  - [TutorialsPoint](https://www.tutorialspoint.com/artificial_intelligence/artificial_intelligence_popular_search_algorithms.htm)
     
   
## Getting Started & Prerequisites :

**Matlab Versions and Libraries :** 

* You need a MATLAB license and an install of MATLAB. .

* No Matlab toolboxes should be required for this program. 

**Functions Provided :** 
   * You find different functions to create the scenario and display the path estimated withing the search functions ( No modify needed however You're free to add some features ) : 
       - [CreateScenario](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/CreateScenario.m),[DisplayScenario](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/DisplayScenario.m) : Create the scenario as a map.We first select the **TARGET** node, then the **Obstacles** ( follow instructions ) and finely the **START** node .See figure
       
       
Target Node        |    Obstacles         |      Start Node        
:-----------------:|:--------------------:|:-------------------:
<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./target.jpg" width="250"> |  <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./obstacle.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./start.jpg" width="250">

 - [AnimatePath](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/filesAnimatePath.m) : Display the founded path on the scenario
 - [Matrix2List](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/Matrix2List.m) : Converts an incident matrix to an incident list
 - [IncidentMatrix](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentMatrix.m) : This function creates the incident matrix based on the scneario defined on the graphical interface form script main.m
 - [IncidentList](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentList.m) : This function creates the incident List based on the scneario defined on the graphical interface form script main.m
 - [IncidentMatrix2](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentMatrix2.m) , [IncidentList2](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentList2.m) :same functions as above but uses irregular costs , check [update_nodes](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/Updates_Nodes.m).
      
           
## Execution & tests : 
   In the figure below , you find an examlpe of the different algorithms : BFS,DFS,A*( euclidian distance , manhattan distance and Variable Costs ) .

Test the code with your own positions of the : target,Start and obsctacles nodes .


BFS       | DFS    |  A* (Euclidian distance) | A* (Manhattan distance) |          
:--------:|:------:|:------------------------:|:-----------------------:|
<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./BFS.jpg" width="250"> |  <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./DFS.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./Astareuc.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./Astarmann.jpg" width="250"> |

## Acknowledgments
* Part of this job was supported by : Valentin Marcel  :thumbsup:
