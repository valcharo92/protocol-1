/*

    Copyright 2019 The Hydro Protocol Foundation

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

*/

pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

import { SafeMath } from "./SafeMath.sol";

library Decimal {
    using SafeMath for uint256;

    uint256 constant BASE = 10**18;

    function one()
        internal
        pure
        returns (uint256)
    {
        return BASE;
    }

    function onePlus(
        uint256 d
    )
        internal
        pure
        returns (uint256)
    {
        return d.add(BASE);
    }

    function mul(
        uint256 target,
        uint256 d
    )
        internal
        pure
        returns (uint256)
    {
        return target.mul(d) / BASE;
    }

    function divFloor(
        uint256 target,
        uint256 d
    )
        internal
        pure
        returns (uint256)
    {
        return target.mul(BASE).div(d);
    }

    function divCeil(
        uint256 target,
        uint256 d
    )
        internal
        pure
        returns (uint256)
    {
        // return target.mul(BASE).add(d).sub(1).div(d).mul(d);
        return target.mul(BASE * 10).div(d).add(5) / 10;
    }
}
