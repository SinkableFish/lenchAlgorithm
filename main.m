randomNode = creatRandomNode(100);
clusterData = zeros(1,5);
usedData = zeros(1, 100);
randNum = rand(1,100);
P = 0.05;
count = 1;
usedNodeCount = 1;
% while (count <= 5);
%     tempRandom = 1;
%     while (tempRandom <= 5)
%         tempNodeNum = ceil(rand*100);
%         tempFind = find(usedData == tempNodeNum);
%         if (isempty(tempFind))
%             usedData(usedNodeCount) = tempNodeNum;
%             clusterData(tempRandom) = tempNodeNum;
%             usedNodeCount = usedNodeCount+1;
%             tempRandom = tempRandom+1;
%         end
%     end
%     data = findCluster(randomNode, clusterData);
%     count = count+1;
% end
while(count < 20)
    tempCluster = find(randNum < P/(1 - P*(mod(count,1/P))));
    data = findCluster(randomNode, tempCluster);
    usedData(tempCluster) = inf ;
    randNum = rand(1,100) + usedData;
    count = count + 1;
end