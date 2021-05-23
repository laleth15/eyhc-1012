import numpy as np
import pandas as pd
import math
#import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from flask import Flask, render_template, request, redirect,jsonify


'''
def single_cluster(df):
    x=df.iloc[:,-1]
    x=np.array(x)
    x=x.reshape(-1,1)
    #Model Defined
    kmean=KMeans(n_clusters=3,init='k-means++')
    #Model Trained
    kmean.fit(x)
    point =points(kmean.labels_)
    colors=colorscheme(kmean.cluster_centers_,kmean.labels_)
    cluster_center = kmean.cluster_centers_.tolist()
    to_drop=[]
    point =points(kmean.labels_)
    labels = kmean.labels_
    if point[cluster_center.index(max(cluster_center))]<=5:
        while point[cluster_center.index(max(cluster_center))]<=5:
            key = cluster_center.index(max(cluster_center))
            to_drop = [i for i, x in enumerate(labels) if x == key]
            print("Dropping Indexes, ",to_drop)
            extremes_removed = df.drop(to_drop)
            extremes_removed.reset_index(drop=True,inplace=True)
            x=extremes_removed.iloc[:,-1]
            x=np.array(x)
            x=x.reshape(-1,1)
            #Model Defined
            kmean_exr=KMeans(n_clusters=3,init='k-means++')
            #Model Trained
            kmean_exr.fit(x)
            cluster_center = kmean_exr.cluster_centers_.tolist()
        #print(kmean_exr.cluster_centers_)
        #print(points(kmean_exr.labels_))
        #plt.rcParams["figure.figsize"]=45,1
        #plt.xticks(rotation=90)
        #plt.yticks(np.arange(0, 3, 1.0))
        #plt.xticks(np.arange(min(global_df.iloc[:,-1]), max(global_df.iloc[:,-1])+1, 2500))
            colors_exr=colorscheme(kmean_exr.cluster_centers_,kmean_exr.labels_)
            labels = kmean_exr.labels_.tolist()
            center = kmean_exr.cluster_centers_.tolist()
            for i in to_drop:
                colors_exr.insert(i,'r')
                labels.insert(i,center.index(max(center)))
        #plt.rcParams["figure.figsize"]=45,5
        #plt.xticks(rotation=90)
        #plt.scatter(df.iloc[:,0],labels,c=colors_exr)
        #plt.show()
        
        df['Zone'] = colors_exr
    else:
        
        df['Zone'] = colors
        #plt.rcParams["figure.figsize"]=45,1
        #plt.xticks(rotation=90)
        #plt.yticks(np.arange(0, 3, 1.0))
        #plt.xticks(np.arange(min(global_df.iloc[:,-1]), max(global_df.iloc[:,-1])+1, 2500))
        #plt.scatter(df.iloc[:,0],kmean.labels_,c=colors)
        #plt.show()
'''


def single_cluster(df):
    x=df.iloc[:,-1]
    x=np.array(x)
    x=x.reshape(-1,1)
    #Model Defined
    kmean=KMeans(n_clusters=3,init='k-means++')
    #Model Trained
    kmean.fit(x)
    point =points(kmean.labels_)
    colors=colorscheme(kmean.cluster_centers_,kmean.labels_)
    cluster_center = kmean.cluster_centers_.tolist()
    to_drop=[]
    point =points(kmean.labels_)
    if point[cluster_center.index(max(cluster_center))]<=5:
        key = cluster_center.index(max(cluster_center))
        to_drop = [i for i, x in enumerate(kmean.labels_) if x == key]
        #print("Dropping Indexes, ",to_drop)
        extremes_removed = df.drop(to_drop)
        extremes_removed.reset_index(drop=True,inplace=True)
        x=extremes_removed.iloc[:,-1]
        x=np.array(x)
        x=x.reshape(-1,1)
        #Model Defined
        kmean_exr=KMeans(n_clusters=3,init='k-means++')
        #Model Trained
        kmean_exr.fit(x)
        #print(kmean_exr.cluster_centers_)
        #print(points(kmean_exr.labels_))
        #plt.rcParams["figure.figsize"]=45,1
        #plt.xticks(rotation=90)
        #plt.yticks(np.arange(0, 3, 1.0))
        #plt.xticks(np.arange(min(global_df.iloc[:,-1]), max(global_df.iloc[:,-1])+1, 2500))
        colors_exr=colorscheme(kmean_exr.cluster_centers_,kmean_exr.labels_)
        labels = kmean_exr.labels_.tolist()
        center = kmean_exr.cluster_centers_.tolist()
        for i in to_drop:
            colors_exr.insert(i,'r')
            labels.insert(i,center.index(max(center)))
        df['Zone'] = colors_exr
        #plt.scatter(df.iloc[:,0],labels,c=colors_exr)
    else:
        df['Zone'] = colors
        #plt.rcParams["figure.figsize"]=45,1
        #plt.xticks(rotation=90)
        #plt.yticks(np.arange(0, 3, 1.0))
        #plt.xticks(np.arange(min(global_df.iloc[:,-1]), max(global_df.iloc[:,-1])+1, 2500))
        #plt.scatter(df.iloc[:,0],kmean.labels_,c=colors)
        



#Gives Number of Members in each CLuster
def points(labels):
    points={0:0,1:0,2:0}
    for i in labels:
        if i==0:
            points[0]+=1
        elif i==1:
            points[1]+=1
        else:
            points[2]+=1

    return(points)


#Function To ColorCode Region
def colorscheme(centers,labels):
    color={0:None,1:None,2:None}
    i=0
    while i<3:
        if centers[i]==max(centers):
            color[i]='r'
        elif centers[i]==min(centers):
            color[i]='g'
        else:
            color[i]='y'
        i+=1
    colormap=[]
    for label in labels:
        if label==0:
            colormap.append(color[0])
        elif label==1:
            colormap.append(color[1])
        else:
            colormap.append(color[2])
            
    #colormap=np.array(colormap)
    return colormap


def zone_count(df):
    i = 0
    size = df.shape[0]
    #zone = []
    zones_count={'R':0,'Y':0,'G':0}
    while i <size:
        a = df.iloc[i,2]
        if a=='g':
            zones_count['G']+=1
        elif a=='y':
            zones_count['Y']+=1
        else:
            zones_count['R']+=1
            
        i+=1
    
    return zones_count


app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')


#Time Series of Total Cases
#case_time_series = pd.read_csv("https://api.covid19india.org/csv/latest/case_time_series.csv")

#Time Series District data
#districts = pd.read_csv('https://api.covid19india.org/csv/latest/districts.csv')

#Statewise per day delta of Confirmed, Recovered and Deceased numbers
#state_wise_daily= pd.read_csv('https://api.covid19india.org/csv/latest/state_wise_daily.csv')

#Statewise cumulative numbers till date.
state_wise= pd.read_csv('https://api.covid19india.org/csv/latest/state_wise.csv')

#Current District Stats
#district_wise= pd.read_csv('https://api.covid19india.org/csv/latest/district_wise.csv')

#Minor Cluster 1 for states



@app.route('/state_json')
def state():
    states = state_wise.iloc[1:,0]
    states_active_cases= state_wise.iloc[1:,4]

    frame = [states ,states_active_cases]
    state_cluster_data = pd.concat(frame,axis=1, join='inner')
    abc =  pd.concat(frame,axis=1, join='inner')
    single_cluster(state_cluster_data)
    '''abc_count = zone_count(state_cluster_data)
    data = {'Region':tuple(state_cluster_data.iloc[:,0]),'Zone':tuple(state_cluster_data.iloc[:,2]),'Active':tuple(state_cluster_data.iloc[:,1]),
    "RED":abc_count['R'],'YELLOW':abc_count['Y'],'GREEN':abc_count['G']}
    return render_template('state.html', data=data)'''
    temp = state_cluster_data.to_dict()
    return_dict={}
    for key1 in temp.keys():
        return_dict[key1]=[]
        for key2,item in temp[key1].items():
            return_dict[key1].append(item)
    

    #print(return_dict)

    return jsonify(return_dict)

@app.route('/state_dict')
def state_dict():
    states = state_wise.iloc[1:,0]
    states_active_cases= state_wise.iloc[1:,4]

    frame = [states ,states_active_cases]
    state_cluster_data = pd.concat(frame,axis=1, join='inner')
    abc =  pd.concat(frame,axis=1, join='inner')
    single_cluster(state_cluster_data)
    '''abc_count = zone_count(state_cluster_data)
    data = {'Region':tuple(state_cluster_data.iloc[:,0]),'Zone':tuple(state_cluster_data.iloc[:,2]),'Active':tuple(state_cluster_data.iloc[:,1]),
    "RED":abc_count['R'],'YELLOW':abc_count['Y'],'GREEN':abc_count['G']}
    return render_template('state.html', data=data)'''
    temp = state_cluster_data.to_dict()
    return_dict={}
    for key1 in temp.keys():
        return_dict[key1]=[]
        for key2,item in temp[key1].items():
            return_dict[key1].append(item)

    #print(return_dict)
    #print(state_cluster_data.to_json())
    return return_dict#state_cluster_data.to_dict()



@app.route('/state_data')
def state_data():
    states = state_wise.iloc[1:,0]
    states_active_cases= state_wise.iloc[1:,4]

    frame = [states ,states_active_cases]
    state_cluster_data = pd.concat(frame,axis=1, join='inner')
    abc =  pd.concat(frame,axis=1, join='inner')
    single_cluster(state_cluster_data)
    '''abc_count = zone_count(state_cluster_data)
    data = {'Region':tuple(state_cluster_data.iloc[:,0]),'Zone':tuple(state_cluster_data.iloc[:,2]),'Active':tuple(state_cluster_data.iloc[:,1]),
    "RED":abc_count['R'],'YELLOW':abc_count['Y'],'GREEN':abc_count['G']}
    return render_template('state.html', data=data)'''
    temp = state_cluster_data.to_dict()
    return_dict={'data':[]}
    key = list(temp.keys())
    for v1,v2,v3 in zip(temp[key[0]].values(),temp[key[1]].values(),temp[key[2]].values()):
        return_dict['data'].append([v1,v2,v3])
    #print(return_dict)
    #print(state_cluster_data.to_json())
    return return_dict#state_cluster_data.to_dict()


@app.route('/state_inventory')
def state_inv():
    states = state_wise.iloc[1:,0]
    states_active_cases= state_wise.iloc[1:,4]
    inventory=pd.read_excel("Inventory.xlsx")
    inventory=inventory.iloc[:,1:]
    frame = [states ,states_active_cases]
    state_cluster_data = pd.concat(frame,axis=1, join='inner')
    #abc =  pd.concat(frame,axis=1, join='inner')
    single_cluster(state_cluster_data)
    '''abc_count = zone_count(state_cluster_data)
    data = {'Region':tuple(state_cluster_data.iloc[:,0]),'Zone':tuple(state_cluster_data.iloc[:,2]),'Active':tuple(state_cluster_data.iloc[:,1]),
    "RED":abc_count['R'],'YELLOW':abc_count['Y'],'GREEN':abc_count['G']}
    return render_template('state.html', data=data)'''
    #print(inventory.to_string())
    #print("---------------------------------------------")
    temp = state_cluster_data.drop([31])
    temp=temp.reset_index(drop=True)
    #print(temp.to_string())
    #print("--------------------------------------------///////////////-")
    temp = pd.concat([temp,inventory],axis=1, join='inner')
    #print(temp.to_string())

    temp = temp.to_dict()
    return_dict={}
    for key1 in temp.keys():
        return_dict[key1]=[]
        for key2,item in temp[key1].items():
            return_dict[key1].append(item)

    #print(return_dict)
    #print(state_cluster_data.to_json())
    return jsonify(return_dict)#state_cluster_data.to_dict()


if __name__ == "__main__":
    app.run(debug=True, port=8000)


