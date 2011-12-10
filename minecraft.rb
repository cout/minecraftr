# http://www.wiki.vg/Protocol
# http://www.wiki.vg/Pre-release_protocol

class Message
  class KeepAlive < Message
    ID = 0x00
    SIZE = 5
  end

  class LoginRequest < Message
    ID = 0x01
    # SIZE = 23 + length of strings
  end

  class Handshake < Message
    ID = 0x02
    # SIZE = 3 + length of strings
  end

  class ChatMessage < Message
    ID = 0x03
    # SIZE = 3 + length of strings
  end

  class TimeUpdate < Message
    ID = 0x04
    SIZE = 9
  end

  class EntityEquipment < Message
    ID = 0x05
    SIZE = 11
  end

  class SpawnPosition < Message
    ID = 0x06
    SIZE = 13
  end

  class UseEntity < Message
    ID = 0x07
    SIZE = 10
  end

  class UpdateHealth < Message
    ID = 0x08
    SIZE = 9
  end

  class Respawn < Message
    ID = 0x09
    SIZE = 14
  end

  class Player < Message
    ID = 0x0A
    SIZE = 2
  end

  class PlayerPosition < Message
    ID = 0x0B
    SIZE = 34
  end

  class PlayerLook < Message
    ID = 0x0C
    SIZE = 10
  end

  class PlayerPositionAndLook < Message
    ID = 0x0D
    SIZE = 42
  end

  class PlayerDigging < Message
    ID = 0x0E
    SIZE = 42
  end

  class PlayerBlockPlacement < Message
    ID = 0x0F
    # SIZE = 11 bytes + slot data
  end

  class HoldingChange < Message
    ID = 0x10
    SIZE = 3
  end

  class UseBed < Message
    ID = 0x11
    SIZE = 15
  end

  class Animation < Message
    ID = 0x12
    SIZE = 6
  end

  class EntityAction < Message
    ID = 0x13
    SIZE = 6
  end

  class NamedEntitySpawn < Message
    ID = 0x14
    # SIZE = 23 + length of strings
  end

  class PickupSpawn < Message
    ID = 0x15
    SIZE = 25
  end

  class CollectItem
    ID = 0x16
    SIZE = 9
  end

  class AddObject
    ID = 0x17
    # SIZE = 22 or 28 bytes
  end

  class MobSpawn
    ID = 0x18
    # SIZE = 20 bytes + metadata (at least 1)
  end

  class EntityPainting
    ID = 0x19
    # SIZE = ?
  end

  class ExperienceOrb
    ID = 0x1A
    SIZE = 19
  end

  class StanceUpdate
    ID = 0x1B
    # SIZE = ?
  end

  class DestroyEntity
    ID = 0x1D
    SIZE = 5
  end

  class Entity
    ID = 0x1E
    SIZE = 5
  end

  class EntityRelativeMove
    ID = 0x1F
    SIZE = 8
  end

  class EntityLook
    ID = 0x20
    SIZE = 7
  end

  class EntityLookAndRelativeMove
    ID = 0x21
    SIZE = 10
  end

  class EntityTeleport
    ID = 0x22
    SIZE = 19
  end

  class EntityStatus
    ID = 0x26
    SIZE = 6
  end

  class AttachEntity
    ID = 0x27
    SIZE = 9
  end

  class EntityMetadata
    ID = 0x28
    # SIZE = 5 bytes + metadata
  end

  class EntityEffect
    ID = 0x29
    SIZE = 9
  end

  class RemoveEntityEffect
    ID = 0x2A
    SIZE = 6
  end

  class Experience
    ID = 0x2B
    SIZE = 9
  end

  class PreChunk
    ID = 0x32
    SIZE = 10
  end

  class MapChunk
    ID = 0x33
    # SIZE = 18 bytes + compressed chunk size
  end
    
  class MultiBlockChange
    ID = 0x34
    # SIZE = 11 bytes + arrays
  end

  class BlockChange
    ID = 0x35
    SIZE = 12
  end

  class BlockAction
    ID = 0x36
    SIZE = 13
  end

  class Explosion
    ID = 0x3C
    # SIZE = 33 bytes + 3 * record_count
  end

  class Effect
    ID = 0x3D
    SIZE = 18
  end

  class NewOrInvalidState
    ID = 0x46
    SIZE = 3
  end

  class Thunderbolt
    ID = 0x47
    SIZE = 18
  end

  class OpenWindow
    ID = 0x64
    # SIZE = 6 + length of string
  end

  class CloseWindow
    ID = 0x65
    SIZE = 2
  end

  class WindowClick
    ID = 0x66
    # SIZE = 8 bytes + slot data
  end

  class SetSlot
    ID = 0x67
    # SIZE = 4 bytes + slot data
  end

  class WindowItems
    ID = 0x68
    # SIZE = 4 bytes + size of slot data array
  end

  class UpdateWindowProperty
    ID = 0x69
    SIZE = 6
  end

  class Transaction
    ID = 0x6A
    SIZE = 5
  end

  class CreateInventoryAction
    ID = 0x6B
    # SIZE = 3 bytes + slot data
  end

  class EnchantItem
    ID = 0x6C
    SIZE = 3
  end

  class UpdateSign
    ID = 0x82
    # SIZE = 11 bytes + 4 strings
  end

  class ItemData
    ID = 0x83
    # SIZE = 6 bytes + text length
  end

  class IncrementStatistic
    ID = 0xC8
    SIZE = 6
  end

  class PlayerListItem
    ID = 0xC9
    # SIZE = 6 bytes + length of string
  end

  class ServerPing
    ID = 0xFE
    # SIZE = ?
  end

  class Disconnect
    ID = 0xFF
    # SIZE = 3 bytes + length of strings
  end
end
