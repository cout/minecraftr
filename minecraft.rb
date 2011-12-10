# http://www.wiki.vg/Protocol
# http://www.wiki.vg/Pre-release_protocol

class Message
  class KeepAlive < Message
    ID = 0x00
    SIZE = 5

    int :id
  end

  class LoginRequest < Message
    ID = 0x01
    # SIZE = 23 + length of strings

    int :protocol_versino
    string :username
    long :map_seed
    int :server_mode
    byte :dimension
    byte :difficulty
    ubyte :world_height
    ubyte :max_players
  end

  class Handshake < Message
    ID = 0x02
    # SIZE = 3 + length of strings

    string :username

    alias_method :username, :hash
  end

  class ChatMessage < Message
    ID = 0x03
    # SIZE = 3 + length of strings

    string :message
  end

  class TimeUpdate < Message
    ID = 0x04
    SIZE = 9

    long :time
  end

  class EntityEquipment < Message
    ID = 0x05
    SIZE = 11

    int :entity_id
    short :slot
    short :item_id
    short :damage
  end

  class SpawnPosition < Message
    ID = 0x06
    SIZE = 13

    int :x
    int :y
    int :z
  end

  class UseEntity < Message
    ID = 0x07
    SIZE = 10

    int :user
    int :target
    bool :left_click?
  end

  class UpdateHealth < Message
    ID = 0x08
    SIZE = 9

    short :health
    short :food
    short :food_saturation
  end

  class Respawn < Message
    ID = 0x09
    SIZE = 14

    byte :dimension
    byte :difficulty
    byte :creative_mode
    short :world_height
    long :map_seed
  end

  class Player < Message
    ID = 0x0A
    SIZE = 2

    bool :on_ground?
  end

  class PlayerPosition < Message
    ID = 0x0B
    SIZE = 34

    double :x
    double :y
    double :stance
    double :z
    bool :on_ground?
  end

  class PlayerLook < Message
    ID = 0x0C
    SIZE = 10

    float :yaw
    float :pitch
    bool :on_ground?
  end

  class PlayerPositionAndLook < Message
    ID = 0x0D
    SIZE = 42

    double :x
    double :y
    double :stance
    double :z
    float :yaw
    float :pitch
    bool :on_ground?
  end

  class PlayerDigging < Message
    ID = 0x0E
    SIZE = 42

    byte :status
    int :x
    byte :y
    int :z
    byte :face
  end

  class PlayerBlockPlacement < Message
    ID = 0x0F
    # SIZE = 11 bytes + slot data

    int :x
    byte :y
    int :z
    byte :direction
    slot :held_item
  end

  class HoldingChange < Message
    ID = 0x10
    SIZE = 3

    short :slot_id
  end

  class UseBed < Message
    ID = 0x11
    SIZE = 15

    int :entity_id
    byte :in_bed
    int :x
    byte :y
    int :z
  end

  class Animation < Message
    ID = 0x12
    SIZE = 6

    int :eid
    byet :animatin
  end

  class EntityAction < Message
    ID = 0x13
    SIZE = 6

    int :eid
    byte :action_id
  end

  class NamedEntitySpawn < Message
    ID = 0x14
    # SIZE = 23 + length of strings

    int :eid
    string :player_name
    int :x
    int :y
    int :z
    byte :rotation
    byte :pitch
    short :current_item
  end

  class PickupSpawn < Message
    ID = 0x15
    SIZE = 25

    int :eid
    short :item
    byte :count
    short :damage
    int :x
    int :y
    int :z
    byte :rotation
    byte :pitch
    byte :roll
  end

  class CollectItem
    ID = 0x16
    SIZE = 9

    int :collected_eid
    int :collector_eid
  end

  class AddObject
    ID = 0x17
    # SIZE = 22 or 28 bytes

    int :eid
    byte :type
    int :x
    int :y
    int :z
    int :thrower_eid
    short :speed_x
    short :speed_y
    short :speed_z
  end

  class MobSpawn
    ID = 0x18
    # SIZE = 20 bytes + metadata (at least 1)

    int :eid
    byte :type
    int :x
    int :y
    int :z
    byte :yaw
    byte :pitch
    metadata :metadata
  end

  class EntityPainting
    ID = 0x19
    # SIZE = ?

    int :eid
    string :title
    int :x
    int :y
    int :z
    int :direction
  end

  class ExperienceOrb
    ID = 0x1A
    SIZE = 19

    int :eid
    int :x
    int :y
    int :z
    short :count
  end

  class StanceUpdate
    ID = 0x1B
    # SIZE = ?

    float :unknown1
    float :unknown2
    float :unknown3
    float :unknown4
    bool :unknown5
    bool :unknown6
  end

  class EntityVelocity
    ID = 0x1C
    SIZE = 5

    int :eid
    short :velocity_x
    short :velocity_y
    short :velocity_z
  end

  class DestroyEntity
    ID = 0x1D
    SIZE = 5

    int :eid
  end

  class Entity
    ID = 0x1E
    SIZE = 5

    int :eid
  end

  class EntityRelativeMove
    ID = 0x1F
    SIZE = 8

    int :eid
    byte :dx
    byte :dy
    byte :dz
  end

  class EntityLook
    ID = 0x20
    SIZE = 7

    int :eid
    byte :yaw
    byte :pitch
  end

  class EntityLookAndRelativeMove
    ID = 0x21
    SIZE = 10

    int :eid
    byte :dx
    byte :dy
    byte :dz
    byte :yaw
    byte :pitch
  end

  class EntityTeleport
    ID = 0x22
    SIZE = 19

    int :eid
    int :x
    int :y
    int :z
    byte :yaw
    byte :pitch
  end

  class EntityStatus
    ID = 0x26
    SIZE = 6

    int :eid
    byte :status
  end

  class AttachEntity
    ID = 0x27
    SIZE = 9

    int :eid
    int :vehicle_id
  end

  class EntityMetadata
    ID = 0x28
    # SIZE = 5 bytes + metadata

    int :eid
    metadata :metadata
  end

  class EntityEffect
    ID = 0x29
    SIZE = 9

    int :eid
    byte :effect_id
    byte :amplifier
    short :duration
  end

  class RemoveEntityEffect
    ID = 0x2A
    SIZE = 6

    int :eid
    byte :effect_id
  end

  class Experience
    ID = 0x2B
    SIZE = 9

    float :experience_bar
    short :level
    short :total_experience
  end

  class PreChunk
    ID = 0x32
    SIZE = 10

    int :x
    int :z
    bool :mode
  end

  class MapChunk
    ID = 0x33
    # SIZE = 18 bytes + compressed chunk size

    int :x
    short :y
    int :z
    byte :size_x
    byte :size_y
    byte :size_z
    int :compressed_size
    byte_array :compressed_data
  end
    
  class MultiBlockChange
    ID = 0x34
    # SIZE = 11 bytes + arrays

    int :chunk_x
    int :chunk_z
    short :array_size
    short_array :coordinate_array
    byte_array :type_array
    byte_array :metadata_array
  end

  class BlockChange
    ID = 0x35
    SIZE = 12

    int :x
    byte :y
    int :z
    byte :block_type
    byte :block_metadata
  end

  class BlockAction
    ID = 0x36
    SIZE = 13

    int :x
    short :y
    int :z
    byte :byte1
    byte :byet2
  end

  class Explosion
    ID = 0x3C
    # SIZE = 33 bytes + 3 * record_count

    double :x
    double :y
    double :z
    float :unknown
    int :record_count
    byte_array :records
  end

  class Effect
    ID = 0x3D
    SIZE = 18

    int :effect_id
    int :x
    byte :y
    int :z
    int :data
  end

  class NewOrInvalidState
    ID = 0x46
    SIZE = 3

    byte :reason
    byet :game_mode
  end

  class Thunderbolt
    ID = 0x47
    SIZE = 18

    int :eid
    bool :unknown
    int :x
    int :y
    int :z
  end

  class OpenWindow
    ID = 0x64
    # SIZE = 6 + length of string

    byte :window_id
    byte :inventory_type
    string :window_title
    byte :num_slots
  end

  class CloseWindow
    ID = 0x65
    SIZE = 2

    byte :window_id
  end

  class WindowClick
    ID = 0x66
    # SIZE = 8 bytes + slot data

    byte :window_id
    short :slot
    byte :right_click
    short :action_number
    bool :shift
    slot :clicked_item
  end

  class SetSlot
    ID = 0x67
    # SIZE = 4 bytes + slot data

    byte :window_id
    short :slot
    slot :slot_data
  end

  class WindowItems
    ID = 0x68
    # SIZE = 4 bytes + size of slot data array

    byte :window_id
    short :count
    slot_array :slot_data
  end

  class UpdateWindowProperty
    ID = 0x69
    SIZE = 6

    byte :window_id
    short :property
    short :value
  end

  class Transaction
    ID = 0x6A
    SIZE = 5

    byte :window_id
    short :action_number
    bool :accepted?
  end

  class CreateInventoryAction
    ID = 0x6B
    # SIZE = 3 bytes + slot data

    short :slot
    slot :clicked_item
  end

  class EnchantItem
    ID = 0x6C
    SIZE = 3

    byte :window_id
    byte :enchantment
  end

  class UpdateSign
    ID = 0x82
    # SIZE = 11 bytes + 4 strings

    int :x
    short :y
    int :z
    string :text1
    string :text2
    string :text3
    string :text4
  end

  class ItemData
    ID = 0x83
    # SIZE = 6 bytes + text length

    short :item_type
    short :item_id
    ubyte :text_length
    byte_array :text
  end

  class IncrementStatistic
    ID = 0xC8
    SIZE = 6

    int :statistic_id
    byte :amount
  end

  class PlayerListItem
    ID = 0xC9
    # SIZE = 6 bytes + length of string

    string :player_name
    bool :online?
    short :ping
  end

  class ServerPing
    ID = 0xFE
    # SIZE = ?
  end

  class Disconnect
    ID = 0xFF
    # SIZE = 3 bytes + length of strings

    string :reason
  end
end
