## Search-Algorithms-in-AI

Searching is the universal technique of problem solving in AI. this project will give you a start with these different algorithms : 
- Brute-Force Search Strategies
    * Breadth-First Search : 
    It starts from the root node, explores the neighboring nodes first and moves towards the next level neighbors. It generates one          tree at a time until the solution is found. It can be implemented using FIFO queue data structure. This method provides shortest path to the solution.**Disadvantage :** Since each level of nodes is saved for creating next one, it consumes a lot of memory space. Space requirement to store nodes is exponential.
    * Depth-First Search :
    It is implemented in recursion with LIFO stack data structure. It creates the same set of nodes as Breadth-First method, only in the different order.**Disadvantage :** this algorithm may not terminate and go on infinitely on one path. The solution to this issue is to choose a cut-off depth. If the ideal cut-off is d, and if chosen cut-off is lesser than d, then this algorithm may fail. If chosen cut-off is more than d, then execution time increases.
- Informed (Heuristic) Search Strategies
    * A* Search :
    It is best-known form of Best First search. It avoids expanding paths that are already expensive, but expands most promising paths first.f(n) = g(n) + h(n), where :         
      - **g(n)** the cost (so far) to reach the node
      - **h(n)** estimated cost to get from the node to the goal
      - **f(n)** estimated total cost of path through n to goal.
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
           
## Execution & tests

* The main programm **ColorTransferDemo** uses :

           function est_im = Color_Transfer_CCS(source,target)

**Arguments :**

- Source Image

- Target Image

**Output :**

- Result Image

**Test folders :**

* Uses some examples files in Example folders : 

           Im_target = imread('Example1/target.jpg');
           Im_source = imread('Example1/source.jpg');
                      
## Test & Results :

**FLower color Transfer :**

Target         |  Source          |      Result        
:-------------:|:----------------:|:-------------------:
<img src="https://github.com/AissamDjahnine/ColorTransfer/blob/master/target.jpg" width="250"> |  <img src="https://github.com/AissamDjahnine/ColorTransfer/blob/master/source.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/ColorTransfer/blob/master/result.jpg" width="250">

**Autumn House color Transfer :**

Target         |  Source          |      Result        
:-------------:|:----------------:|:-------------------:
<img src="https://github.com/AissamDjahnine/ColorTransfer/blob/master/target_1.jpg" width="250"> |  <img src="https://github.com/AissamDjahnine/ColorTransfer/blob/master/source_1.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/ColorTransfer/blob/master/result_1.jpg" width="250">

## Documentation & ressources : 

- You can find the article supporting this work in files : [Color Transfer By Aissam Djahnine](https://github.com/AissamDjahnine/ColorTransfer/blob/master/Djahnine_Aissam_Color_Transfer_in_Correlated_color_space.pdf) explaining the color transfer algorithm. The use of the article needs an approval.

## Authors

**Djahnine Aissam**  
- [Github Profile](https://github.com/AissamDjahnine)
- [Linkedin Profile](https://www.linkedin.com/in/aissamdjahnine/)


## Acknowledgments

* Part of this job was supported by : Valentin Marcel  :thumbsup:



