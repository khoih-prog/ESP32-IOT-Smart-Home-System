SRC_DIR := src
CAYENNE_MQTT_CLIENT_DIR := $(SRC_DIR)/CayenneMQTTClient
CAYENNE_UTILS_DIR := $(SRC_DIR)/CayenneUtils
MQTT_COMMON_DIR := $(SRC_DIR)/MQTTCommon
PLATFORM_DIR := $(SRC_DIR)/Platform/esp32

COMMON_SOURCES := $(notdir $(wildcard $(CAYENNE_MQTT_CLIENT_DIR)/*.c) $(wildcard $(CAYENNE_UTILS_DIR)/*.c) $(wildcard $(MQTT_COMMON_DIR)/*.c))
COMMON_OBJS := $(COMMON_SOURCES:.c=.o)

PLATFORM_OBJS := $(PLATFORM_DIR)/Network.o $(PLATFORM_DIR)/Timer.o
CAYENNE_MQTT_CLIENT_OBJS := $(CAYENNE_MQTT_CLIENT_DIR)/CayenneMQTTClient.o $(CAYENNE_MQTT_CLIENT_DIR)/MQTTClient.o
CAYENNE_UTILS_OBJS := $(CAYENNE_UTILS_DIR)/CayenneDataArray.o $(CAYENNE_UTILS_DIR)/CayenneUtils.o
MQTT_COMMON_OBJS := $(MQTT_COMMON_DIR)/MQTTConnectClient.o $(MQTT_COMMON_DIR)/MQTTDeserializePublish.o $(MQTT_COMMON_DIR)/MQTTPacket.o $(MQTT_COMMON_DIR)/MQTTSerializePublish.o $(MQTT_COMMON_DIR)/MQTTSubscribeClient.o $(MQTT_COMMON_DIR)/MQTTUnsubscribeClient.o

COMPONENT_OBJS = main.o $(PLATFORM_OBJS) $(COMMON_OBJS) $(CAYENNE_MQTT_CLIENT_OBJS) $(CAYENNE_UTILS_OBJS) $(MQTT_COMMON_OBJS)

COMPONENT_PRIV_INCLUDEDIRS := . $(PLATFORM_DIR) $(CAYENNE_MQTT_CLIENT_DIR) $(CAYENNE_UTILS_DIR) $(MQTT_COMMON_DIR)
COMPONENT_SRCDIRS := . $(PLATFORM_DIR) $(CAYENNE_MQTT_CLIENT_DIR) $(CAYENNE_UTILS_DIR) $(MQTT_COMMON_DIR)