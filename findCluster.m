function [ returnMatrix ] = findCluster( location, cluster )
figure();
plot(location(:,1),location(:,2),'*');
% plot(location(cluster, 1), location(cluster, 2), '*');
hold on;
len=length(location(:,1));
linkData = zeros(length(location(: ,1)), 2);
returnMatrix = zeros(len - length(cluster), 2);
for i=1:len
    minDistance = inf;
    count = 1;
    while (count <= length(cluster))
        if (find(cluster == i))
        break;
        else
            j = cluster(count);
            distance=(location(j,1)-location(i,1)).^2 + (location(j,2)-location(i,2)).^2;
            if (distance < minDistance)
                minDistance = distance;
                linkData(i,1) = i;
                linkData(i,2) = j;
            end
            count = count + 1;
        end
    end
    if find(linkData(i, 1) ~= 0)
        tempCluster = linkData(i, 2);
        plot([location(tempCluster, 1), location(i, 1)],[location(tempCluster, 2) location(i, 2)]);
        hold on;
    end
end
k = 1;
for i=1:len
    if(linkData(i, 1) ~= 0)
        returnMatrix(k, 1) = linkData(i, 1);
        returnMatrix(k, 2) = linkData(i, 2);
        k = k+1;
    end
end
end

