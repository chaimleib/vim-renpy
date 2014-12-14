
n this file all the functions and classes related to AI are collected.

init python:
    import itertools  # Mess around with iterables (like lists)
    # This module provides an implementation of the heap queue 
    # algorithm, also known as the priority queue algorithm.
    import heapq


    class AI(renpy.store.object):
        """parent AI class"""
        def __init__(self, parent):
            self.parent = parent
            self.enemy_faction = ['Player']  # not used yet.
            self.preferred_distance = 0
            # the higher the less likely the unit is to approach kinetic users.
            self.kinetic_fear = 0.75
            
            def AI_estimate_damage(self):
                raise NotImplementedError
            
            def AI_attack_target(self):
                raise NotImplementedError
            
            def AI_move_towards(self):
                raise NotImplementedError
            
            def AI(self):
                raise NotImplementedError
            
        
        class DefaultAI(AI):
            def __init__(self, parent):
                AI.__init__(self, parent)
            
            def AI_estimate_damage(self, pship, en=0, range_reduction=0):
                """
                This gets called on every possible target ship. It cycles
                through all the available weapons and sets the field
                'damage_estimation' on the target ship with
                    [WEAPON, ESTIMATED DAMAGE, PRIORITY]
                which then gets used byt the rest of the AI.
                """
                parent = self.parent
                # The higher this number, the greater the effect hate has.
                priority_modifier = 1.5
                # Quit when out of energy
                if en == 0: en = parent.en
                # Init our result with [WEAPON, ESTIMATED DAMAGE, PRIORITY]
                pship.damage_estimation = [None, 0, 0]
                # Failsafe
                if pship < 1:
                    phip.damage_estimation = [None, 0, 0]

